/**
 * This class manages a set of relations between layers.
 */
class QgsRelationManager : QObject
{
%TypeHeaderCode
#include "qgsrelationmanager.h"
%End
  public:

    /** Constructor for QgsRelationManager.
     * @param project associated project (used to notify project of changes)
     */
    explicit QgsRelationManager( QgsProject *project = nullptr );

    /**
     * Will set the specified relations and remove any relation currently set.
     *
     * @param relations A list of relations to set.
     */
    void setRelations( const QList<QgsRelation>& relations );

    /**
     * Get access to the relations managed by this class.
     *
     * @return A QMap where the key is the relation id, the value the relation object.
     */
    const QMap<QString, QgsRelation>& relations() const;

    /**
     * Add a relation.
     *
     * @param relation The relation to add.
     */
    void addRelation( const QgsRelation& relation );

    /**
     * Remove a relation.
     *
     * @param id The id of the relation to remove.
     */
    void removeRelation( const QString& id );

    /**
     * Remove a relation.
     *
     * @param relation The relation to remove.
     */
    void removeRelation( const QgsRelation& relation );

    /**
     * Get access to a relation by its id.
     *
     * @param id The id to search for
     *
     * @return A relation. Invalid if not found.
     * @see relationsByName()
     */
    QgsRelation relation( const QString& id ) const;

    /** Returns a list of relations with matching names.
     * @param name relation name to search for. Searching is case insensitive.
     * @returns a list of matching relations
     * @note added in QGIS 2.16
     * @see relation()
     */
    QList<QgsRelation> relationsByName( const QString& name ) const;

    /**
     * Remove any relation managed by this class.
     */
    void clear();

    /**
     * Get all relations where the specified layer (and field) is the referencing part (i.e. the child table with the foreign key).
     *
     * @param layer     The layer which should be searched for.
     * @param fieldIdx  The field which should be part of the foreign key. If not set will return all relations.
     *
     * @return A list of relations matching the given layer and fieldIdx.
     */
    QList<QgsRelation> referencingRelations( QgsVectorLayer *layer = 0, int fieldIdx = -2 ) const;

    /**
     * Get all relations where this layer is the referenced part (i.e. the parent table with the primary key being referenced from another layer).
     *
     * @param layer   The layer which should be searched for.
     *
     * @return A list of relations where the specified layer is the referenced part.
     */
    QList<QgsRelation> referencedRelations( QgsVectorLayer *layer = 0 ) const;

  signals:
    /** This signal is emitted when the relations were loaded after reading a project */
    void relationsLoaded();

    /**
     * Emitted when relations are added or removed to the manager.
     * @note added in QGIS 2.5
     */
    void changed();
};
